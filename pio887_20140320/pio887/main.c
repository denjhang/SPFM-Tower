#include <pic14/pic16f887.h>
#include <stdint.h> //Needed for uint16_t

//static __code uint16_t __at (_CONFIG1) configword1 = _INTOSC & _WDT_OFF & _PWRTE_OFF & _CP_OFF & _MCLRE_OFF & _LVP_OFF;
static __code uint16_t __at (_CONFIG1) configword1 = _HS_OSC & _WDT_OFF & _PWRTE_OFF & _CP_OFF & _MCLRE_OFF & _LVP_OFF & _BOR_OFF & _DEBUG_OFF;
static __code uint16_t __at (_CONFIG2) configword2 = _WRT_OFF;

// 1�o�C�g���M
void sendByte(unsigned char data){
	while(!TRMT); 
    TXREG = data; 
}
// ���C���֐�
void main () {
	unsigned short flip_cnt = 2000;
	unsigned char reg_flip = 0;
	unsigned char dt = 0x00;
	// ���W�X�^�p
	unsigned char reg = 0x00;
	unsigned char data = 0x00;
	unsigned short i;
	unsigned char cs = 0x00;

	// ������
	OSCCON = 0x70;
	OSCTUNE = 0x52;

	ANSEL	= 0x00;			// �A�i���O�Z���N�^�֎~
	ANSELH	= 0x00;			// �A�i���O�Z���N�^�֎~
	TRISA	= 0xFF;			// �S�r�b�g����
	IOCB	= 0x00;			// ���荞�ݖ��g�p
	WPUB	= 0x00;			// �v���A�b�v���g�p
	TRISB	= 0x00;			// �S�r�b�g�o��
	TRISC	= 0x80;			// �V���A�����͂̂�
	TRISD	= 0x00;			// �S�r�b�g�o��
	PORTA	= 0x00;			// �|�[�gA�N���A
	PORTB	= 0x00;			// �|�[�gB�N���A
	PORTC	= 0x00;			// �|�[�gC�N���A
	PORTD	= 0x01;			// �|�[�gD�N���A
	// �V���A���ݒ�
	BRGH	= 1;			// �n�C�X�s�[�h
//	SPBRG	= 3;			// 312500bps
//	SPBRG	= 2;			// 416000bps
	SPBRG	= 1;			// 625000bps
	SYNC	= 0;			// �񓯊�
	SPEN	= 1;			// �V���A���L��
	TXEN	= 1;			// ���M����
	TX9		= 0;			// 8bit���[�h
	RX9		= 0;
	RCIE	= 0;
	TXIE	= 0;
	CREN	= 1;			// �A����M��

	for(i = 0; i < 32767; i++);
	for(i = 0; i < 32767; i++);
	// ���Z�b�g����
	PORTD = 0x81;
	while(1){
		// �t���b�v�J�E���g����
		if(--flip_cnt == 0){
			reg_flip = 0;			// ���W�X�^���[�h�֕ύX
			flip_cnt = 10000;
			continue;
		}
		// �V���A����M�`�F�b�N
		if(RCIF){
			// �G���[�`�F�b�N
			if(FERR){
				// �t���[�~���O�G���[
				RCREG = '?';
			}else if(OERR){
				// �I�[�o�[�����G���[
				CREN = 0;
				CREN = 1;
				RCREG = '?';
			}else{
				dt = RCREG; // �f�[�^��ۑ�����
				// �f�[�^��M����
				if(reg_flip == 0){
					if(dt == 0xff){
						PORTD = 0x01;
						for(i = 0; i < 20000; i++);
						PORTD = 0x81;
						for(i = 0; i < 20000; i++);
						sendByte('O');
						sendByte('K');
					}else{
						// -------- ���W�X�^�ԍ� --------
						cs = dt & 0xf0;
						dt &= 0x0f;
						if(dt == 0x00){
							cs |= 0x01;
						}else if(dt == 0x01){
							cs |= 0x05;
						}else{
							cs |= 0x09;
						}
						reg_flip++;
					}
				}else if(reg_flip == 1){
					PORTB = dt;
					PORTD = cs;
					PORTD |= 0x01;
					PORTD |= 0x01;
					PORTD &= 0xfe;
					PORTD &= 0xfe;
					PORTD &= 0xfe;
					PORTD &= 0xfe;
					PORTD |= 0x01;
					PORTD |= 0x01;
					PORTD |= 0x01;
					PORTD |= 0x01;
					reg_flip++;
				}else if(reg_flip == 2){
					PORTB = dt;
					PORTD |= 0x03;
					PORTD |= 0x01;
					PORTD |= 0x01;
					PORTD &= 0xfe;
					PORTD &= 0xfe;
					PORTD &= 0xfe;
					PORTD &= 0xfe;
					PORTD |= 0x01;
					PORTD |= 0x01;
					PORTD |= 0x01;
					PORTD |= 0x01;
					reg_flip = 0;
				}
			}
			flip_cnt = 10000;
		}
	}
}

// �R���p�C�����@
// sdcc -V -mpic14 -p16f887 --use-non-free main.c

