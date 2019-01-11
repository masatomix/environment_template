FROM continuumio/anaconda3

# 日本語化
RUN curl -L  "https://oscdl.ipa.go.jp/IPAexfont/ipaexg00301.zip" > font.zip
RUN apt -y install unzip
RUN unzip font.zip
RUN cp ipaexg00301/ipaexg.ttf /opt/conda/lib/python3.7/site-packages/matplotlib/mpl-data/fonts/ttf/ipaexg.ttf
RUN echo "font.family : IPAexGothic" >>  /opt/conda/lib/python3.7/site-packages/matplotlib/mpl-data/matplotlibrc

WORKDIR /workspace
CMD jupyter-lab --no-browser \
  --port=8888 --ip=0.0.0.0 --allow-root