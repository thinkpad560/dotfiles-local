FROM jupyter/datascience-notebook:aarch64-latest
WORKDIR $HOME/work
RUN python -m pip install --upgrade pip

RUN python -m pip install PyMuPDF \
  && python -m pip install jupyterlab-lsp \
  && python -m pip install pip install 'python-lsp-server[all]'
RUN python -m pip install docxtpl jupyter-dash
RUN python -m pip install --upgrade jupyterthemes
RUN python -m pip install jupyter_contrib_nbextensions
RUN R -e "install.packages('nycflights13', dependencies=TRUE, repos='http://cran.rstudio.com/')" \
  && R -e "install.packages('gapminder', dependencies=TRUE, repos='http://cran.rstudio.com/')" \
  && R -e "install.packages('lahman', dependencies=TRUE, repos='http://cran.rstudio.com/')" \
  && R -e "install.packages('swirl', dependencies=TRUE, repos='http://cran.rstudio.com/')" \
  && R -e "install.packages('lubridate', dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN jupyter contrib nbextension install --user \
  && jupyter nbextensions_configurator enable --user \
  && jupyter nbextension enable jupyter-js-widgets/extension \
  && jupyter nbextension enable jupyter-notebook-gist/notebook-extension \
  && jupyter nbextension enable contrib_nbextensions_help_item/main \
  && jupyter nbextension enable autosavetime/main \
  && jupyter nbextension enable codefolding/main \
  && jupyter nbextension enable code_font_size/code_font_size \
  && jupyter nbextension enable code_prettify/code_prettify \
  && jupyter nbextension enable collapsible_headings/main \
  && jupyter nbextension enable comment-uncomment/main \
  && jupyter nbextension enable equation-numbering/main \
  && jupyter nbextension enable execute_time/ExecuteTime \
  && jupyter nbextension enable gist_it/main \
  && jupyter nbextension enable hide_input/main \
  && jupyter nbextension enable spellchecker/main \
  && jupyter nbextension enable toc2/main \
  && jupyter nbextension enable toggle_all_line_numbers/main
COPY SimHei.ttf /opt/conda/lib/python3.10/site-packages/matplotlib/mpl-data/fonts/ttf/SimHei.ttf
COPY matplotlibrc /opt/conda/lib/python3.10/site-packages/matplotlib/mpl-data/matplotlibrc
RUN rm -rf ~/.cache/matplotlib/
