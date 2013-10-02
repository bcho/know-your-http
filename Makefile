PDFS = headers.pdf methods.pdf status-codes.pdf status-codes.zh-CN.pdf methods.zh-CN.pdf
THUMBS = thumbnails/headers.png thumbnails/methods.png thumbnails/status-codes.png
SCREENSHOTS = screenshots/status-codes.zh-CN.png screenshots/methods.zh-CN.png

all: pdfs thumbs screens

pdfs: $(PDFS)

thumbs: $(THUMBS)

screens: $(SCREENSHOTS)

clean:
	@echo "# Cleaning up..."
	rm -f *.aux
	rm -f *.log
	rm -f *.nav
	rm -f *.out
	rm -f $(PDFS)
	rm -f $(PNGS)
	rm -rf thumbnails
	rm -rf screenshots
	rm -f *.snm
	rm -f *.toc

%.pdf: %.tex
	@echo "# Generating $@ from $<..."
	xelatex -shell-escape -interaction=nonstopmode -halt-on-error $<

thumbnails:
	@mkdir -p thumbnails

thumbnails/%.png: %.pdf thumbnails
	@echo "# Generating $@ from $<..."
	convert $< -resize x200 $@

screenshots:
	@mkdir -p screenshots

screenshots/%.png: %.pdf screenshots
	@echo "# Generating $@ from $<..."
	convert $< $@
