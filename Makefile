.PHONY: dev cv cv-watch cv-clean

dev:
	@PUBLIC_USE_LOCAL_OLLAMA=0 PUBLIC_HF_INFERENCE_TOKEN="" npm run dev -- --host --open --port 3000

cv:
	cd tex && latexmk -pdf -interaction=nonstopmode -outdir=build cv.tex
	cp tex/build/cv.pdf static/nathan-cassereau-resume.pdf

cv-watch:
	cd tex && latexmk -pdf -pvc -interaction=nonstopmode -outdir=build cv.tex

cv-clean:
	cd tex && latexmk -C -outdir=build cv.tex
