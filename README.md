# krtrld
krtrld is a reference implementation of the krtrl API. It is a daemon that is written in Nim.

To view the API documentation, see the api directory [here](api/).

## Installation
To install krtrld, run the following command:

```bash
nimble install krtrld
```

# Building
To build krtrld, run the following command:

```bash
git clone https://github.com/krtrl/krtrld
cd krtrld
nimble build
```

The binary will be available as krtrld.

## Testing
To run the tests, run the following command:

```bash
nimble test
```

## Roadmap
- [ ] Finish API specification
- [ ] Implement the krtrl API
