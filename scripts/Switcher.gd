extends StaticBody3D

var switcher = false

func switch():
	if !switcher:
		$anim.play('active')
		switcher = true
	else:
		$anim.play.backwards("artive")
		switcher = false
