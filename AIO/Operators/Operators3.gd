extends Node2D

func _process(delta: float) -> void:
	
	var trzy = 3
	assert(trzy - 1 == 2)
	assert(3 - 1 == 2)
	
	assert(trzy + 1 == 4)
	assert(3 + 1 == 4)
	
	assert(trzy * 8 == 24)
	assert(3 * 8 == 24)
	
	assert(trzy / 3 == 1)
	assert(3 / 3 == 1)
	
	assert(trzy % 2 == 1)
	assert(3 % 2 == 1)
	
	assert(trzy | 4 == 7)
	assert(3 | 4 == 7)
	
	assert(trzy & 2 == 2)
	assert(3 & 2 == 2)
	
	assert(trzy && true == true)
	assert(3 && true == true)
	
	assert(trzy || false == true)
	assert(3 || false == true)
	
	assert(trzy << 2 == 12)
	assert(3 << 2 == 12)
	
	assert(trzy >> 1 == 1)
	assert(3 >> 1 == 1)
	
	assert(trzy ^ 2 == 1)
	assert(3 ^ 2 == 1)
	
	assert(trzy in [2,3,4])
	assert(3 in [2,3,4])
	
	assert(trzy is int)
	assert(3 is int)
	
	assert(trzy as int)
	assert(3 as int)
	
	assert(~trzy == -4)
	assert(~3 == -4)
	
	assert(trzy != 4)
	assert(3 != 4)
	
	assert(!(trzy == 4))
	assert(!(3 == 4))
	
	assert(trzy < 4)
	assert(3 < 4)
	
	assert(trzy <= 4)
	assert(3 <= 4)
	
	assert(trzy > 2)
	assert(3 > 2)
	
	assert(trzy >= 2)
	assert(3 >= 2)
