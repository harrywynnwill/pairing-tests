require 'formatter'
describe Formatter do
  subject(:formatter) {Formatter.new}
  let(:unformatted_text) {"Cardiff West, 11014, C, 17803, L, 4923, UKIP, 2069, LD"}
  let(:formatted_text) {"Cardiff West, 11014, Conservative Party, 30.76%, 17803, Labour Party, 49.72%, 4923, UKIP, 13.75%, 2069, Liberal Democrats, 5.78%"}
  let(:party_codes) {{ C: "Conservative Party",
  L: "Labour Party",
  UKIP: "UKIP",
  LD: "Liberal Democrats",
  G: "Green Party",
  Ind: "Independent",
  SNP: "SNP" }}

  let(:party_code) {"C"}


  describe "#format_results" do
    it "interprets the data into readable information" do
      expect(subject.format_file unformatted_text).to eq formatted_text
    end
  end
  describe "#party_code_lookup" do
    it "returns the party name from the party code" do
      expect(subject.party_code_lookup party_codes, party_code).to eq "Conservative Party"
    end
  end
  describe "#votes_total" do
    it "returns the total number of voters" do
      expect(subject.votes_total unformatted_text).to eq "44444"
    end
  end
end
