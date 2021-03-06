require'./lib/oyster.rb'
describe Oyster_card do

    #As a customer I want money on my card
    it "oyster_card has a balance of zero" do
      expect(subject.balance).to eq(0)
    end
    describe "#top_up" do
      it { is_expected.to respond_to(:top_up).with(1).argument }
    end
    describe "#deduct" do
      it { is_expected.to respond_to(:deduct).with(1).argument }
    end

    it "can top up the balance" do
        expect{ subject.top_up 1 }.to change{ subject.balance }.by 1

    end

    it "raises an error when topup exceeds limit" do
      maximum_balance = Oyster_card::MAXIMUM_BALANCE
      subject.top_up(maximum_balance)
      expect { subject.top_up 1 }.to raise_error "Maximum balance of #{maximum_balance} exceeded"
    end

    it "raises and error when deduction reaches limit" do
      minimum_balance = Oyster_card::MINIMUM_BALANCE
      subject.deduct(minimum_balance)
      expect { subject.deduct 1 }.to raise_error "Minimum balance of #{minimum_balance} reached"
    end
end
