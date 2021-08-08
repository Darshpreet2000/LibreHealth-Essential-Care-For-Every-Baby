import sphinx_rtd_theme

project = 'LibreHealth Essential Care For Every Baby App'
copyright = '2021, LibreHealth'
author = 'LibreHealth'



extensions = ['myst_parser', "sphinx_rtd_theme"]


templates_path = ['_templates']

exclude_patterns = ['_build', 'Thumbs.db', '.DS_Store']


html_theme = "sphinx_rtd_theme"
html_static_path = ['_static']