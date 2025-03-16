@extends('layouts.home')
@section('content')
    <section class="bg-white dark:bg-gray-900 max-w-2xl mx-auto">
        <div class="py-8 lg:py-16 px-4 mx-auto max-w-screen-md">
            <h2 class="mb-4 text-4xl tracking-tight font-extrabold text-center text-gray-900 dark:text-white">Contact Us</h2>
            <p class="mb-8 lg:mb-16 font-light text-center text-gray-500 dark:text-gray-400 sm:text-xl">Got a technical
                issue? Want to send feedback about a beta feature? Need details about our Business plan? Let us know.</p>
            <form action="{{ route('send-comment') }}" class="space-y-8" method="POST">
                @csrf
                @method('POST')
                <div>
                    <label for="name" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300">Your
                        Full Name</label>
                    <input type="text" id="name" name="name"
                        class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500 dark:shadow-sm-light"
                        placeholder="Your Name" required>
                </div>
                <div>
                    <label for="email" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300">Your
                        email</label>
                    <input type="email" id="email" name="email"
                        class="shadow-sm bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500 dark:shadow-sm-light"
                        placeholder="name@****.com" required>
                </div>
                <div>
                    <label for="subject"
                        class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-300">Subject</label>
                    <input type="text" id="subject" name="subject"
                        class="block p-3 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 shadow-sm focus:ring-primary-500 focus:border-primary-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500 dark:shadow-sm-light"
                        placeholder="Let us know how we can help you" required>
                </div>
                <div class="sm:col-span-2">
                    <label for="comment" class="block mb-2 text-sm font-medium text-gray-900 dark:text-gray-400">Your
                        message</label>
                    <textarea id="comment" rows="6" name="comment"
                        class="block p-2.5 w-full text-sm text-gray-900 bg-gray-50 rounded-lg shadow-sm border border-gray-300 focus:ring-primary-500 focus:border-primary-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                        placeholder="Leave a comment..."></textarea>
                </div>
                <style>
                    .buttonSend {
                        font-family: inherit;
                        font-size: 20px;
                        background: royalblue;
                        color: white;
                        padding: 0.7em 1em;
                        padding-left: 0.9em;
                        display: flex;
                        align-items: center;
                        border: none;
                        border-radius: 16px;
                        overflow: hidden;
                        transition: all 0.2s;
                        cursor: pointer;
                    }

                    button span {
                        display: block;
                        margin-left: 0.3em;
                        transition: all 0.3s ease-in-out;
                    }

                    button svg {
                        display: block;
                        transform-origin: center center;
                        transition: transform 0.3s ease-in-out;
                    }

                    button:hover .svg-wrapper {
                        animation: fly-1 0.6s ease-in-out infinite alternate;
                    }

                    button:hover svg {
                        transform: translateX(1.2em) rotate(45deg) scale(1.1);
                    }

                    button:hover span {
                        transform: translateX(5em);
                    }

                    button:active {
                        transform: scale(0.95);
                    }

                    @keyframes fly-1 {
                        from {
                            transform: translateY(0.1em);
                        }

                        to {
                            transform: translateY(-0.1em);
                        }
                    }
                </style>
                <div class="mt-2 flex justify-end">
                    {{-- <button type="submit"
                        class="py-3 px-5 text-sm font-medium text-center text-white rounded-lg bg-green-300 sm:w-fit hover:bg-primary-800 focus:ring-4 focus:outline-none focus:ring-primary-300 dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800">Send
                        message</button> --}}
                    <button class="buttonSend" type="submit">
                        <div class="svg-wrapper-1">
                            <div class="svg-wrapper">
                                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24">
                                    <path fill="none" d="M0 0h24v24H0z"></path>
                                    <path fill="currentColor"
                                        d="M1.946 9.315c-.522-.174-.527-.455.01-.634l19.087-6.362c.529-.176.832.12.684.638l-5.454 19.086c-.15.529-.455.547-.679.045L12 14l6-8-8 6-8.054-2.685z">
                                    </path>
                                </svg>
                            </div>
                        </div>
                        <span>Send</span>
                    </button>
                </div>

            </form>
        </div>
    </section>
@endsection
