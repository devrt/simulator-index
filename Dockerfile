FROM mikefarah/yq as yq

FROM alpine

MAINTAINER Yosuke Matsusaka <yosuke.matsusaka@gmail.com>

RUN apk --update --no-cache add fzf

COPY --from=yq /usr/bin/yq /usr/bin/yq

ADD select.sh /select.sh

ADD index.yaml /index.yaml

CMD ["/select.sh"]