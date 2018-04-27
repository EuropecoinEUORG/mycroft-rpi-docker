#!/bin/sh

mycroft-messagebus &
mycroft-enclosure-client &
mycroft-audio &
mycroft-speech-client &
mycroft-skills
