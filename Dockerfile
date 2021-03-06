FROM ubuntu:16.04
LABEL maintainer="Anshuman Bhartiya"

RUN apt-get update

RUN apt-get install -y libldns-dev git build-essential wget libglib2.0-dev php7.0

RUN wget https://storage.googleapis.com/golang/go1.9.2.linux-amd64.tar.gz && \
    tar xvf go1.9.2.linux-amd64.tar.gz && \
    mv go /usr/local

ENV GOPATH "/root/work"
ENV PATH "$PATH:/usr/local/go/bin:$GOPATH/bin"
ENV GOBIN "$GOPATH/bin/"

RUN go get github.com/tomnomnom/meg && go get github.com/tomnomnom/waybackurls

RUN git clone https://github.com/anshumanbh/megplus.git

WORKDIR /megplus

ENTRYPOINT ["./megplus.sh"]
