FROM flag5/clustersecretbase:0.0.5
ADD /src /src
CMD kopf run -A --verbose --debug /src/handlers.py
