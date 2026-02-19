extends Node

signal open_all_doors()
signal close_all_doors()

func send_open_all_doors() :
	open_all_doors.emit()

func send_close_all_doors() :
	close_all_doors.emit()
