require_relative "../lib/google_searcher"

describe "check if argv is ok" do 
    it "should return something MDR" do
        expect(check_if_user_gave_input).not_to be_nil
        expect(check_if_user_gave_input). be_nil
    end
end

