
DEPS=ioext-core.a65 ioext-ser.a65 ioext-stream.i65

XAARGS=-w -XMASM -XCA65

SUPPORT=ioromldr 

all: ioext-core.bin $(SUPPORT) 

%.bin: %.a65
	xa $(XAARGS) -o $@ $<

ioext-core.bin: $(DEPS)
	xa $(XAARGS) -P $@.lst -DPET -o $@ $<

ioromldr: ioromldr.a65 ioext-comp.a65 $(DEPS)
	xa $(XAARGS) -P $@.lst -DPET -o $@ $<

clean:
	rm -f *.bin *.lst
	rm -f $(SUPPORT)

