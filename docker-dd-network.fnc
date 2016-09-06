#!/bin/sh

#-------------------------------------------------
# <Dopecker>
# Functions for Docker
#-------------------------------------------------
function DN() {
    docker network ls
}

function DNid() {
    id=$(docker network ls| tail -n +2 | peco | awk '{print $1}')
    if [ ! -z "$id" ] ; then
        echo ${id} 
    fi
}
function DNrm() {
    id=$(DNid)
    if [ ! -z "$id" ] ; then
        echo 'docker network rm'
        docker network rm $1 ${id}
    fi
}
function DNinspect() {
    id=$(DNid)
    if [ ! -z "$id" ] ; then
        echo 'docker network inspect'
        docker network inspect ${id}
    fi
}
function DNgateway() {
    id=$(DNid)
    if [ ! -z "$id" ] ; then
        docker network inspect -f '{{range .IPAM.Config}} {{.Gateway}} {{end}}' ${id} | sed "s/ //"
    fi
}
function DNsubnet() {
    id=$(DNid)
    if [ ! -z "$id" ] ; then
        docker network inspect -f '{{range .IPAM.Config}} {{.Subnet}} {{end}}' ${id} | sed "s/ //"
    fi
}
function DNnode() {
    id=$(DNid)
    if [ ! -z "$id" ] ; then
        docker network inspect -f '{{range .Containers}} {{.Name}} {{end}}' ${id} | sed "s/ //"
    fi
}
