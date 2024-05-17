extends Sprite2D

var vida = 40
var esta_morto = false
var esta_comendo = false

func _on_texture_button_pressed():
	if esta_comendo or esta_morto:
		return
		
	$Personagem.play("comendo")
	esta_comendo = true
	await $Personagem.animation_finished
	esta_comendo = false
	vida += 10
	$Personagem.play("idle_feliz")


func _on_timer_timeout():
	if esta_comendo or esta_morto:
		return
		
	vida -= 5
	$VidaLabel.text = str(vida)
	if vida <= 0:
		$Personagem.play("idle_morto")
		esta_morto = true
	elif vida <= 20:
		$Personagem.play("idle_triste")
	else:
		$Personagem.play("idle_feliz")
		
