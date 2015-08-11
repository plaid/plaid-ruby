describe Plaid::Transaction do
  # API: semi-private
  describe '.new' do
    # The reason this looks weird is because it is. This will be refactored for 2.0
    subject { Plaid::Transaction.new(results) }

    def self.with_results(_results, &examples)
      context "with results #{_results}" do
        let(:results) { _results }
        instance_eval(&examples)
      end
    end

    with_results('_id'      =>  'ID')       do it { expect(subject.id).to       eql('ID') }       end
    with_results('_account' =>  'acct')     do it { expect(subject.account).to  eql('acct') }     end
    with_results('date'     => '00/00/00')  do it { expect(subject.date).to     eql('00/00/00') } end
    with_results('amount'   => 100.00)      do it { expect(subject.amount).to   eql(100.00) }     end
    with_results('name'     =>  'Name')     do it { expect(subject.name).to     eql('Name') }     end
    with_results('meta'     => {} )         do it { expect(subject.meta).to     eql({}) }         end
    with_results('meta'     => {'location' => 'Location'}) do it { expect(subject.location).to eql('Location') } end
    with_results('pending'  =>  true)       do it { expect(subject.pending).to  eql(true) }       end
    with_results('score'    =>  200)        do it { expect(subject.score).to    eql(200) }        end
    with_results('type'     =>  'Type')     do it { expect(subject.type).to     eql('Type') }     end

    with_results('category'    => 'Category') do it { expect(subject.category).to    eql('Category') } end
    with_results('category_id' => 100)        do it { expect(subject.category_id).to eql(100) } end
  end
end
