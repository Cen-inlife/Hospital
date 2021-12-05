package com.clh.base.dao;

import com.clh.base.entity.Note;

import java.util.List;

public interface NoteDao {
    void insNote(Note note);

    List<Note> getNoteList(Integer doctor_id);

    Note getNoteById(int note_id);

    void deleteNoteById(Integer note_id);

    void updateNote(Note note);
}
