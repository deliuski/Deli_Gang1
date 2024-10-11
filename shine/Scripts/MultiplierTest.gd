extends Node2D

var peer = ENetMultiplayerPeer.new()

@export var character_0_scene: PackedScene

var host_pressed = false
var player_count = 0

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func _on_host_pressed() -> void:
	host_pressed = true
	peer.create_server(135)
	multiplayer.multiplayer_peer = peer
	multiplayer.peer_connected.connect(_add_player)
	_add_player()

func _on_join_pressed() -> void:
	peer.create_client("localhost", 135)
	multiplayer.multiplayer_peer = peer

func _add_player(id = 1):
	var player = character_0_scene.instantiate()
	player.name = str(id)
	player.position = Vector2(800, 500)
	player.set_multiplayer_authority(id)  # Important for multiplayer authority
	call_deferred("add_child", player)
	player_count += 1
