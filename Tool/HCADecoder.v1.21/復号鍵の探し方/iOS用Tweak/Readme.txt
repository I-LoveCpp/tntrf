
�� �T�v

  iOS��Tweak�Ƃ��ē��삵�A�Ώۂ̃A�v�����N������ƁAHCA���� /tmp/aa �t�@�C���ɒǋL���܂��B


�� �d�g��

  ADX2�f�N���v�^�쐬�֐����t�b�N���A����R�[�h�֔�Ԃ悤�ɂ��܂��B

  ����R�[�h�ł́A�����t�@�C���ɏ������݁A���̊֐��ɖ߂�܂��B


�� ���̃A�v���ւ̉��p

  Tweak��xm�t�@�C����plist�t�@�C���������邱�ƂŁA���̃A�v���ł��g����悤�ɂȂ�܂��B

  1. Clutch2��IDA�Ȃǂ��g���āA�Ώۂ̃A�v�����t�A�Z���u���ł����Ԃɂ��܂��B

  2. HCA�f�t�H���g���𐶐����Ă���֐��������܂��B
     ���̂悤�ȃR�[�h�������Ă���Ǝv���܂��B

48 E4 F9 D2  MOVZ X8, #0xCF22000000000000
E8 E3 C5 F2  MOVK X8, #0x2F1F,LSL#32
88 0E BC F2  MOVK X8, #0xE074,LSL#16
08 2F 91 F2  MOVK X8, #0x8978
�`�`�`
xx xx xx 9x  BL sub_function_name

  3. 2�Ō������֐��̍Ō�ɃT�u���[�`���R�[��(xx xx xx 9x  BL �`)������܂��B
     ���̃R�[���悪�f�N���v�^�쐬�֐��ł��B
     �f�N���v�^�쐬�֐�������A�G���[������"E2011030301"���Q�Ƃł���̂ŁA���̕����񂩂璲�ׂ邱�Ƃ��\�ł��B
     ���̊֐��͂��̂悤�Ȏn�܂�������Ă�Ǝv���܂��B

FC 6F BA A9 STP             X28, X27, [SP,#var_60]!
FA 67 01 A9 STP             X26, X25, [SP,#0x60+var_50]
F8 5F 02 A9 STP             X24, X23, [SP,#0x60+var_40]
F6 57 03 A9 STP             X22, X21, [SP,#0x60+var_30]
F4 4F 04 A9 STP             X20, X19, [SP,#0x60+var_20]
FD 7B 05 A9 STP             X29, X30, [SP,#0x60+var_10]
FD 43 01 91 ADD             X29, SP, #0x60+var_10
FF 83 01 D1 SUB             SP, SP, #0x60
F4 03 02 AA MOV             X20, X2         �������̃A�h���X��4.�ŋL�����܂��B
F6 03 01 AA MOV             X22, X1
F5 03 00 AA MOV             X21, X0

  4. Tweak.xm���e�L�X�g�G�f�B�^�ŊJ���A�A�h���X�����������܂��B

     a_hook�ɂ́A�t�b�N�������A�h���X�����܂��B
     a_code�ɂ́A���s����Ȃ��Ǝv����96�o�C�g���̋󂫗̈�̃A�h���X�����܂��B

  // �A�h���X
  unsigned long int a_hook   =0x1017E5DD8; // ������3.�Ō������f�N���v�^�쐬�֐����̍ŏ���MOV�A�h���X�����܂��B
  unsigned long int a_code   =0x1017E63C0; // ������2.�Ō������f�t�H���g���֐��̃A�h���X�����܂��B
  unsigned long int a_fopen  =0x1018F8984; // ������fopen�̃A�h���X�����܂��B
  unsigned long int a_fclose =0x1018F8900; // ������fclose�̃A�h���X�����܂��B
  unsigned long int a_fwrite =0x1018F8A20; // ������fwrite�̃A�h���X�����܂��B

  5. HCA.plist���e�L�X�g�G�f�B�^�ŊJ���A�ΏۃA�v���̃o���h��ID�ɏ��������܂��B

  6. THEOS �Ńr���h���A�ł���deb�t�@�C�����C���X�g�[����A���X�v�����O���Ă����܂��B

  7. �A�v���N���� /tmp/aa �t�@�C����8�o�C�g�̕��������ǋL����܂��B
     ���܂������ƁA���̂܂܃A�v�������삵�܂��B
     �A�v���������Ă��A���������ǋL����Ă���΂����ł��B


�� �Ɛӎ���

  ����Tweak�𗘗p�������ɂ�邢���Ȃ鑹�Q����҂͈�؂̐ӔC�𕉂��܂���B
  ���Ȃ̐ӔC�̏�Ŏg�p���ĉ������B

