#include <pic14/pic16f887.h>
#include <stdint.h> //Needed for uint16_t

//static __code uint16_t __at (_CONFIG1) configword1 = _INTOSC & _WDT_OFF & _PWRTE_OFF & _CP_OFF & _MCLRE_OFF & _LVP_OFF;
static __code uint16_t __at (_CONFIG1) configword1 = _HS_OSC & _WDT_OFF & _PWRTE_OFF & _CP_OFF & _MCLRE_OFF & _LVP_OFF & _BOR_OFF & _DEBUG_OFF;
static __code uint16_t __at (_CONFIG2) configword2 = _WRT_OFF;

// 1バイト送信
void sendByte(unsigned char data){
	while(!TRMT); 
    TXREG = data; 
}
// メイン関数
void main () {
	unsigned short flip_cnt = 2000;
	unsigned char reg_flip = 0;
	unsigned char dt = 0x00;
	// レジスタ用
	unsigned char reg = 0x00;
	unsigned char data = 0x00;
	unsigned short i;
	unsigned char cs = 0x00;

	// 初期化
	OSCCON = 0x70;
	OSCTUNE = 0x52;

	ANSEL	= 0x00;			// アナログセレクタ禁止
	ANSELH	= 0x00;			// アナログセレクタ禁止
	TRISA	= 0xFF;			// 全ビット入力
	IOCB	= 0x00;			// 割り込み未使用
	WPUB	= 0x00;			// プルアップ未使用
	TRISB	= 0x00;			// 全ビット出力
	TRISC	= 0x80;			// シリアル入力のみ
	TRISD	= 0x00;			// 全ビット出力
	PORTA	= 0x00;			// ポートAクリア
	PORTB	= 0x00;			// ポートBクリア
	PORTC	= 0x00;			// ポートCクリア
	PORTD	= 0x01;			// ポートDクリア
	// シリアル設定
	BRGH	= 1;			// ハイスピード
//	SPBRG	= 3;			// 312500bps
//	SPBRG	= 2;			// 416000bps
	SPBRG	= 1;			// 625000bps
	SYNC	= 0;			// 非同期
	SPEN	= 1;			// シリアル有効
	TXEN	= 1;			// 送信許可
	TX9		= 0;			// 8bitモード
	RX9		= 0;
	RCIE	= 0;
	TXIE	= 0;
	CREN	= 1;			// 連続受信化

	for(i = 0; i < 32767; i++);
	for(i = 0; i < 32767; i++);
	// リセット解除
	PORTD = 0x81;
	while(1){
		// フリップカウント処理
		if(--flip_cnt == 0){
			reg_flip = 0;			// レジスタモードへ変更
			flip_cnt = 10000;
			continue;
		}
		// シリアル受信チェック
		if(RCIF){
			// エラーチェック
			if(FERR){
				// フレーミングエラー
				RCREG = '?';
			}else if(OERR){
				// オーバーランエラー
				CREN = 0;
				CREN = 1;
				RCREG = '?';
			}else{
				dt = RCREG; // データを保存する
				// データ受信処理
				if(reg_flip == 0){
					if(dt == 0xff){
						PORTD = 0x01;
						for(i = 0; i < 20000; i++);
						PORTD = 0x81;
						for(i = 0; i < 20000; i++);
						sendByte('O');
						sendByte('K');
					}else{
						// -------- レジスタ番号 --------
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

// コンパイル方法
// sdcc -V -mpic14 -p16f887 --use-non-free main.c

