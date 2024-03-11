--[[
MIT License

Copyright (c) 2024 xhayper

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
]]
--

--!strict

--- Connection

type ConnectionImpl<Variant... = ...any> = {
	__index: ConnectionImpl<Variant...>,

	new: (signal: Signal<Variant...>, fn: (Variant...) -> ()) -> Connection<Variant...>,

	Disconnect: (self: Connection<Variant...>) -> (),
}

type ConnectionProto<Variant... = ...any> = {
	_connected: boolean,
	_signal: Signal<Variant...>,
	_fn: (Variant...) -> (),
	_next: false | Connection<Variant...>,
}

export type Connection<Variant... = ...any> = typeof(setmetatable(
	{} :: ConnectionProto<Variant...>,
	{} :: ConnectionImpl<Variant...>
))

--- Signal

type SignalImpl<Variant... = ...any> = {
	__index: SignalImpl<Variant...>,

	-- TODO: Implement below when luau supports this kind of recursive type
	-- TODO: <T...>() -> Signal<T...>
	new: () -> Signal<Variant...>,

	Connect: (self: Signal<Variant...>, func: (Variant...) -> ()) -> Connection<Variant...>,
	DisconnectAll: (self: Signal<Variant...>) -> (),

	Fire: (self: Signal<Variant...>, Variant...) -> (),
	Wait: (self: Signal<Variant...>) -> Variant...,
	Once: (self: Signal<Variant...>, func: (Variant...) -> ()) -> Connection<Variant...>,
}

type SignalProto<Variant... = ...any> = {
	_handlerListHead: false | Connection<Variant...>,
}

export type Signal<Variant... = ...any> = typeof(setmetatable(
	{} :: SignalProto<Variant...>,
	{} :: SignalImpl<Variant...>
))

return {}
