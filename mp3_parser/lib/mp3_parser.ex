defmodule Mp3Parser do
  @moduledoc """
  Documentation for Mp3Parser.
  """

  @doc """
  """
  def get_title_and_artist(mp3file) do
    get_id3_tag(mp3file)
  end

  def get_id3_tag(mp3file) do
    case File.read(mp3file) do
      {:ok, mp3} ->
          mp3_audio_size = (byte_size(mp3) - 128)
          << _ :: binary-size(mp3_audio_size), id3_tag :: binary >> = mp3
          << "TAG",
              title :: binary-size(30),
              artist :: binary-size(30),
              album :: binary-size(30),
              year :: binary-size(30),
              _ :: binary >> = id3_tag
          {title, artist, album, year}
      {:error, reason} -> reason
    end
  end
end
