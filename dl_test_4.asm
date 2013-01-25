;bitmap graphics in mode 
	
	*=$3000  ; begin assembly at page $30
	
	;SECTION ONE -- EQUATES
	
	;antic control shadow location equates
	
sdmctl = $022f  ; direct memory access control -- store 0 here to disable and $22 to enable
sdlstl = $0230  ; display list location lo-byte
sdlsth = $0231  ; display list location hi-byte
	
	;color register equates -- these registers are in CTIA and are write only
	
color0 = $02c4  ; bit pattern: 01
color1 = $02c5  ; bit pattern: 10
color2 = $02c6  ; bit pattern: 11
color3 = $02c7  ; presently unused
color4 = $02c8  ; bit pattern: 00
	
	;colors
	
	;black 			= #$00
	;dark_grey 		= #$04
	;grey 			= #$06
	;white 			= #$0E
	;gold 			= #$14
	;yellow 		= #$18
	;brown 			= #$22
	;tan 			= #$24
	;orange 		= #$36
	;red 			= #$42
	;pink 			= #$48
	;magenta		= #$52
	;purple 		= #$60
	;lavender 		= #$66
	;blue 			= #$74
	;lt_blue		= #$78
	;turquoise 		= #$A4
	;green 			= #$C4
	;lt_green 		= #$C8
	;yellow_green	= #$D6
	;olive_green 	= #$E4
	;peach 			= #$F6
	
	;display list

dlist

	*=$4000 ;begin display list on page $40

	.byte $70 , $70 , $70 	;blank 24 scanlines -- 24 mode lines remaining
	.byte $48         		;LMS and ANTIC mode 8
	.byte $50 , $40   
	.byte $08 , $08 , $08 , $08 , $08 , $08 , $08 , $08 , $08 , $08
	.byte $08 , $08 , $08 , $08 , $08 , $08 , $08 , $08 , $08 , $08	
	.byte $08 , $08 , $08 , $08       		;24 mode lines
	.byte $41         		;JVB
	.byte $00 , $40       
	
	;bitmap
	
screen_ram
	
	*=$4050
	
	.byte $1B , $1B , $1B , $1B , $1B , $1B , $1B , $1B , $1B , $1B	
	.byte $E4 , $E4 , $E4 , $E4 , $E4 , $E4 , $E4 , $E4 , $E4 , $E4
	.byte $1B , $1B , $1B , $1B , $1B , $1B , $1B , $1B , $1B , $1B
	.byte $E4 , $E4 , $E4 , $E4 , $E4 , $E4 , $E4 , $E4 , $E4 , $E4
	.byte $1B , $1B , $1B , $1B , $1B , $1B , $1B , $1B , $1B , $1B
	.byte $E4 , $E4 , $E4 , $E4 , $E4 , $E4 , $E4 , $E4 , $E4 , $E4
	.byte $1B , $1B , $1B , $1B , $1B , $1B , $1B , $1B , $1B , $1B
	.byte $E4 , $E4 , $E4 , $E4 , $E4 , $E4 , $E4 , $E4 , $E4 , $E4
	.byte $1B , $1B , $1B , $1B , $1B , $1B , $1B , $1B , $1B , $1B
	.byte $E4 , $E4 , $E4 , $E4 , $E4 , $E4 , $E4 , $E4 , $E4 , $E4
	.byte $1B , $1B , $1B , $1B , $1B , $1B , $1B , $1B , $1B , $1B
	.byte $E4 , $E4 , $E4 , $E4 , $E4 , $E4 , $E4 , $E4 , $E4 , $E4
	.byte $1B , $1B , $1B , $1B , $1B , $1B , $1B , $1B , $1B , $1B
	.byte $E4 , $E4 , $E4 , $E4 , $E4 , $E4 , $E4 , $E4 , $E4 , $E4
	.byte $1B , $1B , $1B , $1B , $1B , $1B , $1B , $1B , $1B , $1B
	.byte $E4 , $E4 , $E4 , $E4 , $E4 , $E4 , $E4 , $E4 , $E4 , $E4
	.byte $1B , $1B , $1B , $1B , $1B , $1B , $1B , $1B , $1B , $1B
	.byte $E4 , $E4 , $E4 , $E4 , $E4 , $E4 , $E4 , $E4 , $E4 , $E4
	.byte $1B , $1B , $1B , $1B , $1B , $1B , $1B , $1B , $1B , $1B
	.byte $E4 , $E4 , $E4 , $E4 , $E4 , $E4 , $E4 , $E4 , $E4 , $E4
	.byte $1B , $1B , $1B , $1B , $1B , $1B , $1B , $1B , $1B , $1B
	.byte $E4 , $E4 , $E4 , $E4 , $E4 , $E4 , $E4 , $E4 , $E4 , $E4
	.byte $1B , $1B , $1B , $1B , $1B , $1B , $1B , $1B , $1B , $1B
	.byte $E4 , $E4 , $E4 , $E4 , $E4 , $E4 , $E4 , $E4 , $E4 , $E4
	
colors
	
	*=$3150
	lda #0
	sta color4
	lda #$78
	sta color0
	lda #$74
	sta color1
	lda #$0E
	sta color2
	
initialize_ANTIC

	lda #0
	sta sdmctl
	lda #$00
	sta sdlstl
	lda #$40
	sta sdlsth
	lda #$22
	sta sdmctl
	    
change_colors
    
    lda #0
	sta color4
	lda #$78
	sta color0
	lda #$74
	sta color1
	lda #$0E
	sta color2
    jsr delay
    
    lda #$0E
	sta color4
	lda #$0
	sta color0
	lda #$78
	sta color1
	lda #$74
	sta color2
    jsr delay
    
    lda #$74
	sta color4
	lda #$0E
	sta color0
	lda #$0
	sta color1
	lda #$78
	sta color2
    jsr delay
    
    lda #$78
	sta color4
	lda #$74
	sta color0
	lda #$0E
	sta color1
	lda #$0
	sta color2
    jsr delay
    jmp change_colors


delay

	ldx #$FF
m	dex
	beq x 
	ldy #$FF
n	dey
	bne n
	jmp m
	    
x	rts
    
        