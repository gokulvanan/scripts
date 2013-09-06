#!/usr/bin/python

import socket

def main():
	server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
	server.bind((socket.gethostname(),9000))
	server.listen(5)
	print "server listening"
	while 1:
		print "in loop"
		(client, addr) = server.accept()
		data = client.recv(20)
		print data
		client.send("echo back"+str(data))
		# client.close()

if __name__ == '__main__':
  main()