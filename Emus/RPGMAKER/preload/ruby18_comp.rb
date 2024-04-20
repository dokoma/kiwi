class NilClass
	def id
		4
	end
	def type
		"NilClass"
	end
end

class Hash
	def index(*args)
		key(*args)
	end
end

class Array
	def to_s
		return self.join
	end
end

$DEBUG=true
#uninitialized constant SaveUtil::Zlib
#System::Save::COMPRESS=false
