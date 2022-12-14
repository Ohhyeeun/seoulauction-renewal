
let subscriber = new llnwrtssdk.Subscriber();
let subscriber2 = new llnwrtssdk.Subscriber();

if (matchMedia("all and (min-width: 1024px)").matches) {
    subscriber2.off('*',handleSubscriberEvent);
    // subscribe to events
    subscriber.on('*',handleSubscriberEvent);
    (function(llnwrtssdk) {
        'use strict';
        console.log('Starting!');
        var subscribe_config = {
            mediaElement: document.getElementById('llnw-rts-subscriber'),
            host: 'selauction-rts.s.llnwi.net',
            shortName: 'selauction',
            streamName: 'mg',
        };
        subscriber.init(subscribe_config)
            .then(function () {
                console.log('Subscribing!');
                return subscriber.subscribe().then(function () {
                    console.log('Playing!');
                })
                    .catch(function (err) {
                        console.log('Could not play: ' + err);
                    });
            });
    })(window.llnwrtssdk);
} else {
    subscriber.off('*',handleSubscriberEvent);
    subscriber2.on('*',handleSubscriberEvent);
    (function(llnwrtssdk) {
        'use strict';
        console.log('Starting!');
        var subscribe_config2 = {
            mediaElement: document.getElementById('llnw-rts-subscriber2'),
            host: 'selauction-rts.s.llnwi.net',
            shortName: 'selauction',
            streamName: 'mg',
        };
        subscriber2.init(subscribe_config2)
            .then(function () {
                console.log('Subscribing!');
                return subscriber2.subscribe().then(function () {
                    console.log('Playing!');
                })
                    .catch(function (err) {
                        console.log('Could not play: ' + err);
                    });
            });
    })(window.llnwrtssdk);
}

//---------------------------------------------------------------------------
function handleSubscriberEvent (event) {
  // The name of the event:
  var type = event.type;
  var subscriber = event.subscriber;
  // Optional data releated to the event (not available on all events):
  var data = event.data;
  console.log(type);
  //based on the type of event .. you may want to look further into subsriver/data objects
}

$(window).resize(function(){
    if (matchMedia("all and (min-width: 1024px)").matches) {
        subscriber2.off('*',handleSubscriberEvent);
        // subscribe to events
        subscriber.on('*',handleSubscriberEvent);
        (function(llnwrtssdk) {
            'use strict';
            console.log('Starting!');
            var subscribe_config = {
                mediaElement: document.getElementById('llnw-rts-subscriber'),
                host: 'selauction-rts.s.llnwi.net',
                shortName: 'selauction',
                streamName: 'mg',
            };
            subscriber.init(subscribe_config)
                .then(function () {
                    console.log('Subscribing!');
                    return subscriber.subscribe().then(function () {
                        console.log('Playing!');
                    })
                        .catch(function (err) {
                            console.log('Could not play: ' + err);
                        });
                });
        })(window.llnwrtssdk);
    } else {
        subscriber.off('*',handleSubscriberEvent);
        subscriber2.on('*',handleSubscriberEvent);
        (function(llnwrtssdk) {
            'use strict';
            console.log('Starting!');
            var subscribe_config2 = {
                mediaElement: document.getElementById('llnw-rts-subscriber2'),
                host: 'selauction-rts.s.llnwi.net',
                shortName: 'selauction',
                streamName: 'mg',
            };
            subscriber2.init(subscribe_config2)
                .then(function () {
                    console.log('Subscribing!');
                    return subscriber2.subscribe().then(function () {
                        console.log('Playing!');
                    })
                        .catch(function (err) {
                            console.log('Could not play: ' + err);
                        });
                });
        })(window.llnwrtssdk);
    }
});