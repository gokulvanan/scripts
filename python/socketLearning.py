#!/usr/bin/python

import socket;

def main():
	client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
	client.connect(("localhost",9000))
	client.send("data")








if __name__ == '__main__':
	main()