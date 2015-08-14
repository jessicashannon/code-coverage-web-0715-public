# Use this song data for your tests
songs = [
  "The Phoenix - 1901",
  "Tokyo Police Club - Wait Up",
  "Sufjan Stevens - Too Much",
  "The Naked and the Famous - Young Blood",
  "(Far From) Home - Tiga",
  "The Cults - Abducted",
  "The Phoenix - Consolation Prizes"
]

describe 'Jukebox' do
  let(:songs) {
    [
      "The Phoenix - 1901",
      "Tokyo Police Club - Wait Up",
      "Sufjan Stevens - Too Much",
      "The Naked and the Famous - Young Blood",
      "(Far From) Home - Tiga",
      "The Cults - Abducted",
      "The Phoenix - Consolation Prizes"
    ]
  }

  let(:song_regexes) {
    [
      /The Phoenix - 1901/,
      /Tokyo Police Club - Wait Up/,
      /Sufjan Stevens - Too Much/,
      /The Naked and the Famous - Young Blood/,
      /\(Far From\) Home - Tiga/,
      /The Cults - Abducted/,
      /The Phoenix - Consolation Prizes/
    ]
  }

  let(:song_regexes_with_indicies) {
    [
      /1 The Phoenix - 1901/,
      /2 Tokyo Police Club - Wait Up/,
      /3 Sufjan Stevens - Too Much/,
      /4 The Naked and the Famous - Young Blood/,
      /5 \(Far From\) Home - Tiga/,
      /6 The Cults - Abducted/,
      /7 The Phoenix - Consolation Prizes/
    ]
  }

  let(:jukebox) { Jukebox.new(songs) }

  describe '#new' do
    it 'accepts a list of songs on initialization' do
      expect{Jukebox.new(songs)}.to_not raise_error
    end

    it 'assigns the list of songs to an instance variable' do
      expect(jukebox.instance_variable_get(:@songs)).to eq(songs)
    end

    it 'creates new instances of itself' do
      expect(jukebox).to be_an_instance_of(Jukebox)
    end
  end

  describe '#on?' do
    it 'can tell if it is on' do
      expect(jukebox.on?).to be(true)
    end
  end

  describe '#exit' do
    it 'responds to a call method' do
      expect(jukebox).to respond_to(:exit)
    end

      it 'turns itself off' do
        expect(jukebox.exit).to match(/Goodbye, thanks for listening!/)
      end
  end

  describe '#command' do
    it 'responds to a command method' do
      expect(jukebox).to respond_to(:command)
    end

#### No idea what this means --
# Pretty sure it's wrong since I just copied it
# from the internet.
  it "returns nil from allowed messages" do
    dbl = jukebox.command("Some Collaborator")
    allow(dbl).to receive(:foo)
    expect(dbl.foo).to be_nil
  end
end

### Need one more test here

  describe '#help' do
    it 'prints the available commands' do
      # help_output = capture_stdout { jukebox.help }
      expect(jukebox.help).to match(/Please select help, list, exit, or play./)
    end
  end

  describe '#list' do
    it 'lists the songs a user can play' do
      song_regexes_with_indicies.each do |regex|
        expect(jukebox.list).to match(regex)
      end
    end
  end

  describe '#play' do
    it 'can take a song name as an argument' do
      # play_with_song_name_output = capture_stdout { ) }
      expect(jukebox.play("The Phoenix - 1901")).to match(/now playing The Phoenix - 1901/)
    end
  end
end
