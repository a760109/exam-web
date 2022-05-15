import { createSlice, createAction } from '@reduxjs/toolkit';

export const exchangeToken = createAction('user/exchangeToken', (idToken, userData) => {
  return {
    idToken,
    userData,
  };
});

export const clearToken = createAction('user/clearToken', () => {
  localStorage.clear();
  return {};
});

const initialState = {
  isAuthenticated: false,
};

const userSlice = createSlice({
  name: 'auth/user',
  initialState,
  extraReducers: {
    [exchangeToken]: (state, action) => {
      return {
        ...state,
        ...action.payload,
        isAuthenticated: true,
      };
    },
    [clearToken]: state => initialState,
  },
});

export default userSlice.reducer;
