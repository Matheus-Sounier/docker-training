import express from 'express';

const app = express();

app.use(express.json());


app.listen(3000, () => {
    console.log('Server está funcionando');
});

// app.use('/users', userRoutes);

app.get('/', (req, res) => {
    res.send('Hello World!');
});

