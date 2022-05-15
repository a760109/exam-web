import { Auth } from './auth';
import { useSelector, Provider } from 'react-redux';
import store from './store';

function App() {
  return (
    <Provider store={store}>
      <Auth>
        <div>123456</div>
      </Auth>
    </Provider>
  );
}

export default App;
