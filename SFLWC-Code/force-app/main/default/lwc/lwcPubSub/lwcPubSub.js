// Since this is going to used as a service module,
// we have deleted the file lwcPubSub.html from this
// project. 

// Creating the publisher/subscriber module

const store = {};
// store is a JavaScript object that keeps track of 
// events and their associated callback functions.

const subscribe = (eventName, callback) => {
    if (!store[eventName]) {
        // Assign a unique value to the event using Set();
        store[eventName] = new Set();
    }
    // Store the callback method as well
    store[eventName].add(callback);

}

const publish = (eventName, payload) => {
    if (store[eventName]) {
        store[eventName].forEach(callback => {
            try {
                callback(payload);
            } catch (error) {
                console.error(error)
            }
        });
    }

    /*
    const unsubscribe = (eventName, callback) => {
        if (store[eventName]) {
            store[eventName].delete(callback)
        }
    }
    */
}

export default {
    subscribe,
    publish

}