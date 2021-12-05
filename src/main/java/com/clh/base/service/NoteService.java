package com.clh.base.service;

import com.clh.base.entity.Note;
import com.clh.base.util.ResultUtil;

public interface NoteService {
    void insNote(Note note);

    ResultUtil getNoteList(Integer page, Integer limit, Integer doctor_id);

    Note getNoteById(int note_id);

    void deleteNoteById(Integer note_id);

    void updateNote(Note note);
}
