<?php


namespace test;

// FIX: Wait ?
// TODO: do something
// HACK: wat
// WARNING: WARNING
// NOTE: NOTE
// PERF: HEY
// NOTE
// WARNING ??

/**
 * Class test
 * @author yourname
 */
class test implements Itest
{
	private int $wat;

	private $var;

	private hello $h;dsadsa


	public function __construct(hello $h, $var = null)
	{
		$this->var = $var;
		$this->h = $h;
	}

	public function rr()
	{
	}

	public function test(hello $wat)
	{
		$this->h->generateTest($wat);
		$this->wat = 5;
	}
}

interface Itest
{
	public function rr();
}

class hello
{
	public function generateTest($wat)
	{
	}
}
