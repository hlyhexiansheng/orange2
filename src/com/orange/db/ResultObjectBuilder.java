package com.orange.db;

import java.sql.ResultSet;
import java.sql.SQLException;

public interface ResultObjectBuilder<T> {
    public abstract Object build(ResultSet resultset)
    throws SQLException;
}
