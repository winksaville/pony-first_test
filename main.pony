use "ponytest"
use "debug"

actor Main is TestList
  new create(env: Env) =>
    Debug.out("Main.create:+")
    PonyTest(env, this)
    Debug.out("Main.create:-")

  new make() =>
    Debug.out("Main.make:+-")

  fun tag tests(test: PonyTest) =>
    Debug.out("Main.tests:+")
    test(_TestAdd)
    test(_TestSub)
    Debug.out("Main.tests:-")

class iso _TestAdd is UnitTest
  fun name(): String => "addition"

  fun apply(h: TestHelper) =>
    Debug.out("_TestAdd.apply:+")
    h.assert_eq[U32](4, 2 + 2)
    Debug.out("_TestAdd.apply:-")

class iso _TestSub is UnitTest
  fun name(): String => "substraction"

  fun apply(h: TestHelper) =>
    Debug.out("_TestSub.apply:+")
    h.assert_eq[U32](2, 4 - 2)
    Debug.out("_TestSub.apply:-")
