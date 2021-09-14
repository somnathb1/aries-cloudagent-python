FROM bcgovimages/von-image:py36-1.15-1

ENV ENABLE_PTVSD 0

ADD requirements*.txt ./

RUN pip3 install --no-cache-dir \
    -r requirements.txt \
    -r requirements.askar.txt \
    -r requirements.bbs.txt \
    -r requirements.dev.txt

ADD aries_cloudagent ./aries_cloudagent
ADD bin ./bin
ADD README.md ./
ADD setup.py ./

RUN pip3 install --no-cache-dir -e .

RUN mkdir logs && chown -R indy:indy logs && chmod -R ug+rw logs

RUN apk add --no-cache \
	nginx \
	bash
COPY nginx.conf ./
COPY start.sh ./

ENTRYPOINT ["/bin/bash", "./start.sh"]
