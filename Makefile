
DEPS=ioext-core.a65 ioext-ser.a65 ioext-stream.i65 ioext-i2c.a65 i2clib.a65 i2clib.i65

IOEXT_FILENAME=512

XAARGS=-w -XMASM -XCA65 -DIOEXT_FILENAME=$(IOEXT_FILENAME) 

SUPPORT=ioromldr4


all: ioext-core.bin $(SUPPORT) term

%.bin: %.a65
	xa $(XAARGS) -o $@ $<

ioext-core.bin: $(DEPS)
	xa $(XAARGS) -P $@.lst -o $@ $<

ioromldr4: ioromldr4.a65 ioext-comp4.a65 $(DEPS)
	xa $(XAARGS) -P $@.lst -o $@ $<

term: term.bas
	petcat -w40 -o $@ -- $<

clean:
	rm -f *.bin *.lst
	rm -f $(SUPPORT)
	rm -f term

