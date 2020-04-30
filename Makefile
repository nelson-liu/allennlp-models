.PHONY : version
version :
	@python -c 'from allennlp_models.version import VERSION; print(f"AllenNLP Models v{VERSION}")'

.PHONY : lint
lint :
	flake8
	black --check .

.PHONY : typecheck
typecheck :
	mypy allennlp_models --ignore-missing-imports --no-strict-optional --no-site-packages

.PHONY : test
test :
	pytest --color=yes -rf --durations=40

.PHONY : test-with-cov
test-with-cov :
	pytest --color=yes -rf --cov-config=.coveragerc --cov=allennlp_models/ --durations=40