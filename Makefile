

XAARGS=-w -XMASM -XCA65

SUPPORT=ioromldr 

all: ioext-core.bin $(SUPPORT) 

%.bin: %.a65
	xa $(XAARGS) -o $@ $<

ioext-core.bin: ioext-core.a65
	xa $(XAARGS) -P $@.lst -DPET -o $@ $<

ioromldr: ioromldr.a65 ioext-comp.a65 ioext-core.a65
	xa $(XAARGS) -P $@.lst -DPET -o $@ $<

clean:
	rm -f *.bin *.lst
	rm -f $(SUPPORT)

