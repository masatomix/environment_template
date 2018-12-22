#!/bin/bash


vagrant package default --output box_image.box
vagrant box add masatomix/box_image ./box_image.box

