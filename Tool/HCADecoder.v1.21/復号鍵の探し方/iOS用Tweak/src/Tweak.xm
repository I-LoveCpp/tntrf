#import <substrate.h>
#import <mach/mach.h>
#import <mach-o/dyld.h>

%ctor{

  // アドレス
  unsigned long int a_hook   =0x1017E5DD8;
  unsigned long int a_code   =0x1017E63C0;
  unsigned long int a_fopen  =0x1018F8984;
  unsigned long int a_fclose =0x1018F8900;
  unsigned long int a_fwrite =0x1018F8A20;

  // コード
  unsigned int b=0x14000000,c[]={
    0xA9BD07E0, // stp x0,x1,[sp,-0x30]!
    0xA90153E2, // stp x2,x20,[sp,0x10]
    0xD2E00C24, // movz x4,0x0061 ;"/tmp/aa"
    0xF2CC25E4, // movk x4,0x612F
    0xF2AE0DA4, // movk x4,0x706D
    0xF28E85E4, // movk x4,0x742F
    0xD2A00C45, // movz x5,0x0062 ;"a+b"
    0xF2856C25, // movk x5,0x2B61
    0xA90217E4, // stp x4,x5,[sp,0x20]
    0x910083E0, // add x0,sp,0x20
    0x9100A3E1, // add x1,sp,0x28
    0x94000000, // bl fopen
    0xAA0003F4, // mov x20,x0
    0xF94003E0, // ldr x0,[sp]
    0xD2800101, // movz x1,8
    0xD2800022, // movz x2,1
    0xAA1403E3, // mov x3,x20
    0x94000000, // bl fwrite
    0xAA1403E0, // mov x0,x20
    0x94000000, // bl fclose
    0xA94153E2, // ldp x2,x20,[sp,0x10]
    0xA8C307E0, // ldp x0,x1,[sp],0x30
    0x00000000, // 
    0x14000000, // b a_key
  };
  b    |=((unsigned int)((a_code-(signed)a_hook)/4))&0x03FFFFFF; // b a_code
  c[11]|=((unsigned int)((a_fopen-(signed)(a_code+4*11))/4))&0x03FFFFFF;
  c[17]|=((unsigned int)((a_fwrite-(signed)(a_code+4*17))/4))&0x03FFFFFF;
  c[19]|=((unsigned int)((a_fclose-(signed)(a_code+4*19))/4))&0x03FFFFFF;
  c[23]|=((unsigned int)((a_hook+4-(signed)(a_code+4*23))/4))&0x03FFFFFF;

  // コード書き換え
  unsigned long int a,s=0;
  mach_port_t mt=mach_task_self();
  const mach_header *mh=_dyld_get_image_header(0);
  if(mh->flags&MH_PIE)s=_dyld_get_image_vmaddr_slide(0);
  a=s+a_hook;
  if(vm_protect(mt,a,sizeof(b),false,VM_PROT_READ|VM_PROT_WRITE|VM_PROT_COPY)==0){
    vm_offset_t p;uint32_t size;
    vm_read(mt,a,sizeof(b),&p,&size);
    memcpy(&c[22],(void *)p,size);
    if(vm_write(mt,a,(vm_offset_t)&b,sizeof(b))==0){
      vm_protect(mt,a,sizeof(b),false,VM_PROT_READ|VM_PROT_EXECUTE);
    }
  }
  a=s+a_code;
  if(vm_protect(mt,a,sizeof(c),false,VM_PROT_READ|VM_PROT_WRITE|VM_PROT_COPY)==0){
    if(vm_write(mt,a,(vm_offset_t)c,sizeof(c))==0){
      vm_protect(mt,a,sizeof(c),false,VM_PROT_READ|VM_PROT_EXECUTE);
    }
  }

}
