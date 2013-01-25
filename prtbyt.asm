	;from the book How to Program your Atari in 6502 Language
	*=$2000
	lda #$05
	clc
	adc #$03
	jsr prtbyt
	brk
	
prtbyt

	*=$1000
	
	sta $1023
	lsr
	lsr
	lsr
	lsr
	jsr $1014
	lda $1023
	jsr $1014
	lda $1023
	rts
	and #$0F
	cmp #$0A
	clc
	bmi $101D
	ADC #$07
	ADC #$30
	jmp $F6A4
	brk
	
	