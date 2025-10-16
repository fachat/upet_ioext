

SUPPORT=ioromldr 

all: ioext-core.bin $(SUPPORT) 

%.bin: %.a65
	xa -XMASM -o $@ $<

ioext-core.bin: ioext-core.a65
	xa -P $@.lst -DPET -XMASM -o $@ $<

ioromldr: ioromldr.a65 ioromcomp.a65 ioext-core.a65
	xa -XMASM -w -P $@.lst -DPET -o $@ $<

clean:
	rm -f *.bin *.lst
	rm -f $(SUPPORT)

