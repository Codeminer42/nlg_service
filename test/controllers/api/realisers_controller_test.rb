require 'test_helper'

class Api::RealisersControllerTest < ActionController::TestCase

  setup do
    @appositive_payload = File.read(Rails.root.join("test/fixtures/appositive_payload.xml"))
    @a_problem_payload = File.read(Rails.root.join("test/fixtures/a_problem_payload.xml"))
    @complex_payload = File.read(Rails.root.join("test/fixtures/complex_test_payload.xml"))
  end

  test "realise appositive recording" do
    post :create, xml: @appositive_payload
    assert_response :success
    assert_equal assigns[:realisation], "An angioplasty balloon catheter, the D701000000992, was deployed."
  end

  test "realise a problem recording" do
    post :create, xml: @a_problem_payload
    assert_response :success
    assert_equal assigns[:realisation], "There is an eccentric, tubular stenosis in the third obtuse marginal branch.There is an 80 % stenosis in the proximal right coronary artery."
  end

  test "realise a complex recording with multiple records" do
    post :create, xml: @complex_payload
    assert_response :success
    assert_equal assigns[:realisation], "Hello, world.


The patient lied etherised upon a table. The patient lied etherised upon a table.


* an 18 thing but a 180 thing
* an 18x thing but a 08 thing
* an 11g thing but a 9i thing
* an 8th thing but a 9th thing
* an 11th thing but a 1100 thing
* an 11.000 thing but an 11000 thing
* an 81000 thing but a 180,000 thing
* an 81,000 thing but a 01834 thing
* an 8% thing but a 9% thing
* an 8432425 thing but a 42nd thing

There is an 80 % in-stent restenosis in the proximal right coronary artery.


There is a 95 %, eccentric in-stent restenosis (8 mm length) in the proximal right coronary artery.


The right coronary artery is a vessel with luminal irregularities.


* Normal coronary arteries.
* Normal left heart hemodynamics.
* Normal right heart hemodynamics."
  end

end
