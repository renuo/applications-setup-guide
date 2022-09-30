# Renuo Applications Setup Guide

## Introduction

If you are reading this document it means that you have to setup a new application.
A new project started and it's now time to set everything up so that **everyone**,
in your team, **can start working on it**.

This document will try to be as minimalist as possible and provide you with all the steps to set up the application as
fast as possible.
There are things, in Renuo projects, which are mandatory, other that are suggested.

The basic things that need to be ready before the team can start working on a project are:

* An existing *git* repository containing the project
* Three main branches: *main*, *develop*
* A README with essential information about the application
* Convenience-scripts: `bin/setup`, `bin/check`, `bin/fastcheck`, `bin/run`
* One running, green test
* Continuous integration (*CI*) ready, running and green for the main branches
* Continuous deployment (*CD*) ready and running for the main branches
* The application deployed for the main branches

As an appendix you'll find a [checklist](checklist.md) you can use to follow the guide.

The guide consists of generic paragraphs that will be referenced from the specific application types
(e.g. How to configure the CI will be referenced from both *Rails* and *Angular* setup guides)

Again: The purpose of this guide is to have your project setup as fast as possible so that the rest
of the team can start working on the project with you.
Before starting to follow this guide you should also have clear in mind, what is the architecture of your system
(e.g, a monolithic Rails Application, a two layers app, a native app, etc.)

**:exclamation: One more, important, final note: Do not blindly follow this guide,
think always about what you are doing and why.
If you think something is wrong or simply outdated, improve this guide with a Pull Request.**

We want you to know exactly the reason behind each single step of this guide.

Thank you for your work and have fun! :tada:

## License

[Attribution 4.0 International (CC BY 4.0)](https://creativecommons.org/licenses/by/4.0/legalcode)
