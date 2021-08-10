import Foundation

struct MONO_PCM {
    let fs: Int
    let bits: Int
    let length: Int
    var s: [Double]
}

//typedef struct
//{
//  int fs; /* �W�{�����g�� */
//  int bits; /* �ʎq�����x */
//  int length; /* ���f�[�^�̒��� */
//  double *s; /* ���f�[�^ */
//} MONO_PCM;
