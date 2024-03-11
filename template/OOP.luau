---------- WITHOUT GENERIC ----------

type ClassWithoutGenericImpl = {
	__index: ClassWithoutGenericImpl,

	new: () -> ClassWithoutGeneric,

	-- TODO: Define functions...
}

type ClassWithoutGenericProto = {
	-- TODO: Define properties...
}

export type ClassWithoutGeneric = typeof(setmetatable({} :: ClassWithoutGenericProto, {} :: ClassWithoutGenericImpl))

----------- WITH GENERIC ------------

type ClassWithGenericImpl<Variant... = ...any> = {
	__index: ClassWithGenericImpl<Variant...>,

	-- TODO: Implement below when luau supports this kind of recursive type
	-- TODO: new: <T...>() -> ClassWithGeneric<T...>
	new: () -> ClassWithGeneric<Variant...>,

	-- TODO: Define functions...
}

type ClassWithGenericProto<Variant... = ...any> = {
	-- TODO: Define properties...
}

export type ClassWithGeneric<Variant... = ...any> = typeof(setmetatable(
	{} :: ClassWithGenericProto<Variant...>,
	{} :: ClassWithGenericImpl<Variant...>
))
