describe AddDataService do
  it "should create a data point" do
    subject.call(1, time = Time.now, 10)
    datapoint = DataPoint.first
    datapoint.data_stream_id.should eql(1)
    datapoint.value.should eql(10.0)
    datapoint.timestamp.to_i.should eql(time.to_i)
  end
end